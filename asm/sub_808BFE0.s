	.syntax unified
	.set GetItemCrit, 0x080173CC + 1
	.set GetItemHit, 0x0801739C + 1
	.set GetItemMight, 0x08017384 + 1
	.set GetItemWeight, 0x080173B4 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80043DC, 0x080043DC + 1
	.set sub_8016A68, 0x08016A68 + 1
	.set sub_8016B3C, 0x08016B3C + 1
	.section .text.sub_808BFE0, "ax", %progbits
@ sub_808BFE0 @ JP 0x0808BFE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808BFE0
	.thumb_func
sub_808BFE0:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0808C058 @ =0x0203E7A8
	bl sub_8016B3C
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #7
	bl sub_80043B8
	adds r0, r5, #0
	bl sub_8016A68
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x39
	movs r2, #7
	bl sub_80043B8
	adds r0, r5, #0
	bl GetItemWeight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #7
	bl sub_80043DC
	adds r4, #8
	adds r0, r5, #0
	bl GetItemMight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl sub_80043DC
	adds r0, r5, #0
	bl GetItemHit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x51
	movs r2, #7
	bl sub_80043DC
	adds r0, r5, #0
	bl GetItemCrit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #7
	bl sub_80043DC
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808C058: .4byte 0x0203E7A8

