/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.acbr.ibge.demo;

import com.acbr.ACBrSessao;
import com.acbr.ibge.ACBrIBGE;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.application.Preloader;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;


/**
 *
 * @author rften
 */
public class FrmMain extends javax.swing.JFrame {

    private ACBrIBGE acbrIBGE;

    /**
     * Creates new form FrmMain
     */
    public FrmMain() {
        initComponents();
        try {
            acbrIBGE = new ACBrIBGE();
        } catch (Exception ex) {
            Logger.getLogger(FrmMain.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel8 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        rtbRespostas = new javax.swing.JTextArea();
        btnSalvar = new javax.swing.JButton();
        btnCarregarConfiguracoes = new javax.swing.JButton();
        jPanel20 = new javax.swing.JPanel();
        lblCodMunicipio = new javax.swing.JLabel();
        btnBuscarPorCodigo = new javax.swing.JButton();
        txtCodMunicipio = new javax.swing.JTextField();
        jPanel21 = new javax.swing.JPanel();
        lblCidade = new javax.swing.JLabel();
        txtCidade = new javax.swing.JTextField();
        lblUF = new javax.swing.JLabel();
        txtUF = new javax.swing.JTextField();
        chkCaixaeAcentos = new javax.swing.JCheckBox();
        btnBuscarPorNome = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("ACBrLibIBGE Demo");
        setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        setResizable(false);
        setSize(new java.awt.Dimension(744, 588));
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowActivated(java.awt.event.WindowEvent evt) {
                formWindowActivated(evt);
            }
        });

        jPanel8.setBorder(javax.swing.BorderFactory.createTitledBorder("Respostas"));

        rtbRespostas.setColumns(20);
        rtbRespostas.setRows(5);
        jScrollPane1.setViewportView(rtbRespostas);

        javax.swing.GroupLayout jPanel8Layout = new javax.swing.GroupLayout(jPanel8);
        jPanel8.setLayout(jPanel8Layout);
        jPanel8Layout.setHorizontalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING)
        );
        jPanel8Layout.setVerticalGroup(
            jPanel8Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel8Layout.createSequentialGroup()
                .addGap(0, 0, Short.MAX_VALUE)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
        );

        btnSalvar.setText("Salvar Configurações");
        btnSalvar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSalvarActionPerformed(evt);
            }
        });

        btnCarregarConfiguracoes.setLabel("Carregar Configurações");
        btnCarregarConfiguracoes.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCarregarConfiguracoesActionPerformed(evt);
            }
        });

        jPanel20.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Por Código", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel20.setToolTipText("Por Código");
        jPanel20.setName("Por Código"); // NOI18N

        lblCodMunicipio.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        lblCodMunicipio.setText("Cod. Município");

        btnBuscarPorCodigo.setText("Buscar");
        btnBuscarPorCodigo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBuscarPorCodigoActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel20Layout = new javax.swing.GroupLayout(jPanel20);
        jPanel20.setLayout(jPanel20Layout);
        jPanel20Layout.setHorizontalGroup(
            jPanel20Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel20Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel20Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel20Layout.createSequentialGroup()
                        .addComponent(lblCodMunicipio)
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addComponent(txtCodMunicipio))
                .addContainerGap())
            .addGroup(jPanel20Layout.createSequentialGroup()
                .addGap(40, 40, 40)
                .addComponent(btnBuscarPorCodigo)
                .addContainerGap(44, Short.MAX_VALUE))
        );
        jPanel20Layout.setVerticalGroup(
            jPanel20Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel20Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(lblCodMunicipio)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(txtCodMunicipio, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnBuscarPorCodigo)
                .addContainerGap(19, Short.MAX_VALUE))
        );

        jPanel21.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Por Nome", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 11))); // NOI18N
        jPanel21.setToolTipText("Por Nome");
        jPanel21.setName("Por Nome"); // NOI18N

        lblCidade.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        lblCidade.setText("Cidade");

        lblUF.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        lblUF.setText("UF");

        chkCaixaeAcentos.setText("Ignorar Caixa e Acentos");

        btnBuscarPorNome.setText("Buscar");
        btnBuscarPorNome.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnBuscarPorNomeActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel21Layout = new javax.swing.GroupLayout(jPanel21);
        jPanel21.setLayout(jPanel21Layout);
        jPanel21Layout.setHorizontalGroup(
            jPanel21Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel21Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel21Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel21Layout.createSequentialGroup()
                        .addGroup(jPanel21Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtCidade, javax.swing.GroupLayout.PREFERRED_SIZE, 233, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(lblCidade))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel21Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel21Layout.createSequentialGroup()
                                .addComponent(lblUF)
                                .addGap(0, 51, Short.MAX_VALUE))
                            .addComponent(txtUF)))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel21Layout.createSequentialGroup()
                        .addComponent(btnBuscarPorNome)
                        .addGap(18, 18, 18)
                        .addComponent(chkCaixaeAcentos)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel21Layout.setVerticalGroup(
            jPanel21Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel21Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel21Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(lblCidade)
                    .addComponent(lblUF))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel21Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(txtCidade, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(txtUF, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel21Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(chkCaixaeAcentos)
                    .addComponent(btnBuscarPorNome))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jPanel8, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jPanel20, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jPanel21, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(btnSalvar)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnCarregarConfiguracoes)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel20, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel21, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnSalvar)
                    .addComponent(btnCarregarConfiguracoes))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel8, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        btnCarregarConfiguracoes.getAccessibleContext().setAccessibleName("Salvar Carregar Configurações");

        setSize(new java.awt.Dimension(539, 334));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void formWindowActivated(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowActivated
        try {
            // Altera as config de log
            Path pathLog = Paths.get(System.getProperty("user.dir"), "Log");
            if (!Files.isDirectory(pathLog)) {
                pathLog.toFile().mkdirs();
            }

            acbrIBGE.configGravarValor(ACBrSessao.Principal, "LogNivel", 4);
            acbrIBGE.configGravarValor(ACBrSessao.Principal, "LogPath", pathLog.toString());
            acbrIBGE.configGravar();

            loadConfig();
        } catch (Exception ex) {
            Logger.getLogger(FrmMain.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_formWindowActivated

    
    private void btnSalvarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSalvarActionPerformed
        saveConfig();
    }//GEN-LAST:event_btnSalvarActionPerformed

    private void btnCarregarConfiguracoesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCarregarConfiguracoesActionPerformed
        loadConfig();
    }//GEN-LAST:event_btnCarregarConfiguracoesActionPerformed

    private void btnBuscarPorCodigoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBuscarPorCodigoActionPerformed
        
        if (txtCodMunicipio.getText().isEmpty()){
            JOptionPane.showMessageDialog(this, "Informe o Codigo do Municipio",
                                   "ERROR", JOptionPane.ERROR_MESSAGE);
            return;
        }
        try {
            
            String AcodMun = txtCodMunicipio.getText();
            int codMun = Integer.parseInt(AcodMun);
            
           String ret = acbrIBGE.buscarPorCodigo(codMun);
            rtbRespostas.append(ret);
        }catch (Exception ex) {
           Logger.getLogger(FrmMain.class.getName()).log(Level.SEVERE, null, ex); 
        }
        
    }//GEN-LAST:event_btnBuscarPorCodigoActionPerformed

    private void btnBuscarPorNomeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnBuscarPorNomeActionPerformed
        
        if (txtCidade.getText().isEmpty()){
            JOptionPane.showMessageDialog(this, "Nome do Município deve ser informado",
                                   "ERROR", JOptionPane.ERROR_MESSAGE);
            return;
        }
        
        try {
            String ret = acbrIBGE.buscarPorNome(txtCidade.getText(), txtUF.getText(), false);
            rtbRespostas.append(ret);
        }catch (Exception ex) {
           Logger.getLogger(FrmMain.class.getName()).log(Level.SEVERE, null, ex); 
        }
        
    }//GEN-LAST:event_btnBuscarPorNomeActionPerformed

    private void loadConfig() {
        try {
            acbrIBGE.configLer();           
            chkCaixaeAcentos.setSelected(acbrIBGE.configLerValor(ACBrSessao.IBGE, "IgnorarCaixaEAcentos").equals("1"));

        } catch (Exception ex) {
            Logger.getLogger(FrmMain.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void saveConfig() {
        try {
            acbrIBGE.configGravarValor(ACBrSessao.IBGE, "IgnorarCaixaEAcentos",chkCaixaeAcentos.isSelected());
            acbrIBGE.configGravar();            
            
        } catch (Exception ex) {
            Logger.getLogger(FrmMain.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnBuscarPorCodigo;
    private javax.swing.JButton btnBuscarPorNome;
    private javax.swing.JButton btnCarregarConfiguracoes;
    private javax.swing.JButton btnSalvar;
    private javax.swing.JCheckBox chkCaixaeAcentos;
    private javax.swing.JPanel jPanel20;
    private javax.swing.JPanel jPanel21;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel lblCidade;
    private javax.swing.JLabel lblCodMunicipio;
    private javax.swing.JLabel lblUF;
    private javax.swing.JTextArea rtbRespostas;
    private javax.swing.JTextField txtCidade;
    private javax.swing.JTextField txtCodMunicipio;
    private javax.swing.JTextField txtUF;
    // End of variables declaration//GEN-END:variables
}
