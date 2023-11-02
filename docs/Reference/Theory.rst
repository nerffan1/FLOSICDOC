.. _Theory:

###########################
Theoretical Background
###########################
 
The Perdew-Zunger self-interaction correction (`PZSIC`_) is a computationally demanding task. The FLOSIC method
attempts to alleviate this computational complexity by parametrizing canonical (KS) orbitals into Fermi orbitals (FOs),

.. math::

    F_{i \sigma}(\vec{r})=\frac{\sum_\alpha \psi_{\alpha \sigma}^*\left(\vec{a}_{i \sigma}\right) 
    \psi_{\alpha \sigma}(\vec{r})}{\sqrt{\sum_\alpha\left|\psi_{\alpha \sigma}\left(\vec{a}_{i \sigma}\right)\right|^2}} .

where the :math:`\vec{a}_{i \sigma}` are the Fermi-orbital descriptors (FODs). The optimal positions 
are found by minimizing the FOD forces,

.. math::

    \frac{d E^{S I C}}{d a_m}=\sum_{k l} \varepsilon_{k l}^k\left\{\left\langle\frac{d \phi_k}{d a_m} 
    \mid \phi_l\right\rangle-\left\langle\frac{d \phi_l}{d a_m} \mid \phi_k\right\rangle\right\} .

You can check this paper to learn more about `FO derivatives`_

.. _PZSIC: https://journals.aps.org/prb/abstract/10.1103/PhysRevB.23.5048 
.. _FO derivatives: https://pubmed.ncbi.nlm.nih.gov/25681892/ 