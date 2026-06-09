	.syntax unified
	.set PrepAutoCapDeployUnits, 0x08097C94 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_8097B9C, 0x08097B9C + 1
	.set sub_8097C08, 0x08097C08 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_809CBC4, "ax", %progbits
@ sub_809CBC4 @ JP 0x0809CBC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809CBC4
	.thumb_func
sub_809CBC4:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl sub_80265CC
	movs r0, #0
	str r0, [sp]
	ldr r1, _0809CBF4 @ =0x02022C08
	ldr r2, _0809CBF8 @ =0x01000008
	mov r0, sp
	bl sub_80D636C
	bl sub_8097B9C
	ldr r0, [r4, #0x14]
	bl PrepAutoCapDeployUnits
	bl sub_8097C08
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CBF4: .4byte 0x02022C08
_0809CBF8: .4byte 0x01000008

