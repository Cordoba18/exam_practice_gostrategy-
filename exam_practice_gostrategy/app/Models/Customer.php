<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;

    protected $table = 'customers';
    protected $primaryKey = 'dni';
    protected $fillable = ['id_reg', 'id_com','email', 'name','lastname','address','date_reg','status'];



}
