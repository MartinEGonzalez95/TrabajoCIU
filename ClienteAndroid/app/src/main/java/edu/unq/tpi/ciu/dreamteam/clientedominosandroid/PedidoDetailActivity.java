package edu.unq.tpi.ciu.dreamteam.clientedominosandroid;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.app.ActionBar;
import android.support.v4.app.NavUtils;
import android.view.MenuItem;


public class PedidoDetailActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_usuario_detail);
        Toolbar toolbar = (Toolbar) findViewById(R.id.detail_toolbar);
        setSupportActionBar(toolbar);

        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            actionBar.setDisplayHomeAsUpEnabled(true);
        }


        if (savedInstanceState == null) {
            Bundle arguments = new Bundle();
            PedidoDetailFragment fragment = new PedidoDetailFragment();
            arguments.putString(PedidoDetailFragment.PEDIDO_ID,
                    getIntent().getStringExtra(PedidoDetailFragment.PEDIDO_ID));


            fragment.setArguments(arguments);
            getSupportFragmentManager().beginTransaction()
                    .add(R.id.usuario_detail_container, fragment)
                    .commit();
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == android.R.id.home) {

            NavUtils.navigateUpTo(this, new Intent(this, UsuarioPedidosListActivity.class));
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

}
