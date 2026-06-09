	.syntax unified
	.set NewPopup_WeaponBroke, 0x080117CC + 1
	.set sub_807CB28, 0x0807CB28 + 1
	.section .text.sub_807CAE4, "ax", %progbits
@ sub_807CAE4 @ JP 0x0807CAE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CAE4
	.thumb_func
sub_807CAE4:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r5, _0807CB20 @ =0x0203A4E8
	adds r0, r5, #0
	bl sub_807CB28
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CAFA
	adds r4, r5, #0
_0807CAFA:
	ldr r5, _0807CB24 @ =0x0203A568
	adds r0, r5, #0
	bl sub_807CB28
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807CB0A
	adds r4, r5, #0
_0807CB0A:
	cmp r4, #0
	beq _0807CB1A
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	adds r1, r6, #0
	bl NewPopup_WeaponBroke
_0807CB1A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CB20: .4byte 0x0203A4E8
_0807CB24: .4byte 0x0203A568

