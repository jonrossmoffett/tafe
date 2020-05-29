<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Contact;

class ContactsTest extends TestCase
{
    use RefreshDatabase;

    /** @test */
    public function a_contact_can_be_added()
    {
        $this->withoutExceptionHandling();
        $this->post('/api/contacts', $this->data());

        $contact = Contact::first();

        $this->assertEquals('test name', $contact->name);
        $this->assertEquals('jrmoffett1@gmail.com', $contact->email);
        $this->assertEquals('05/14/1998', $contact->birthday);
        $this->assertEquals('abc', $contact->company);
    }

    /** @test */
    public function a_name_is_required()
    {
        $response = $this->post('/api/contacts', array_merge($this->data(), ['name' => '']));
        $response->assertSessionHasErrors('name');
        $this->assertCount(0, Contact::all());
    }

    /** @test */
    public function a_email_is_required()
    {
        $response = $this->post('/api/contacts', array_merge($this->data(), ['email' => '']));
        $response->assertSessionHasErrors('email');
        $this->assertCount(0, Contact::all());
    }

    /** @test */
    public function fields_are_required()
    {
        collect((['name', 'email', 'birthday', 'company'])->each(
            function ($field) {
                $response = $this->post('/api/contacts', array_merge($this->data(), [$field => '']));
                $response->assertSessionHasErrors($field);
                $this->assertCount(0, Contact::all());
            }
        ));
    }

    /** @test */
    public function a_contact_can_be_retreived()
    {
        $contact = factory(Contact::class)->create();

        $response = $this->get('/api/contacts/' . $contact->id);

        $response->assertJson([
            'name' => $contact->name,
            'email' => $contact->email,
            'birthday' => $contact->birthday,
            'company' => $contact->company
        ]);
    }

    public function data()
    {
        return [
            'name' => 'test name',
            'email' => 'jrmoffett1@gmail.com',
            'birthday' => '05/14/1998',
            'company' => 'abc'
        ];
    }
}
