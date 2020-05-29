<?php

namespace App\Policies;

use App\Enquiry;
use App\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class EnquiryPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view any models.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function viewAny(User $user)
    {
        return true;
    }

    /**
     * Determine whether the user can view the model.
     *
     * @param  \App\User  $user
     * @param  \App\Enquiry  $enquiry
     * @return mixed
     */
    public function view(User $user, Enquiry $enquiry)
    {
        return (strtolower($user->roles->first()->name) == 'admin') || ($user->id == $enquiry->id);
    }

    /**
     * Determine whether the user can create models.
     *
     * @param  \App\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        return true;
    }

    /**
     * Determine whether the user can update the model.
     *
     * @param  \App\User  $user
     * @param  \App\Enquiry  $enquiry
     * @return mixed
     */
    public function update(User $user, Enquiry $enquiry)
    {
        return $user->id == $enquiry->id;
    }

    /**
     * Determine whether the user can delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\Enquiry  $enquiry
     * @return mixed
     */
    public function delete(User $user, Enquiry $enquiry)
    {
        return $user->id == $enquiry->id;
    }

    /**
     * Determine whether the user can restore the model.
     *
     * @param  \App\User  $user
     * @param  \App\Enquiry  $enquiry
     * @return mixed
     */
    public function restore(User $user, Enquiry $enquiry)
    {
        if($user->roles->first()->name == 'admin'){
            return true;
        }

        return $user->id == $enquiry->id;
    }

    /**
     * Determine whether the user can permanently delete the model.
     *
     * @param  \App\User  $user
     * @param  \App\Enquiry  $enquiry
     * @return mixed
     */
    public function forceDelete(User $user, Enquiry $enquiry)
    {
        //
    }
}
