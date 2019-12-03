@extends('layout.base')
@section('title', 'Classes')
@section('content')
            <div id="app">

                <table class="table table-striped" >
                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">Klass</th>
                                <th scope="col">Resturang</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>TE16</td>
                                <td>
                                <div class="radio">
                                <input type="radio" name="1">greek grill</div>
                                <div class="radio">
                                <input type="radio" name="1">olearys</div>
                                </td>
                                <td class="remove">ta bort</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>TE17</td>
                                <td>
                                <div class="radio">
                                <input type="radio" name="2">greek grill</div>
                                <div class="radio">
                                <input type="radio" name="2">olearys</div>
                                </td>
                                <td class="remove">ta bort</td>
                            </tr>
                            <tr>
                                
                                <th scope="row">3</th>
                                <td>TE18</td>
                                <td>
                                <div class="radio">
                                <input type="radio" name="3">greek grill</div>
                                <div class="radio">
                                <input type="radio" name="3">olearys</div>
                                </td>
                                <td class="remove">ta bort</td>
                            </tr>
                        </tbody>
                    </table>
                <button type="button" class="btn btn-primary">Spara</button>
                <class-page>
            </class-page>
            </div>
            
@endsection
@section('scripts')
    
@endsection