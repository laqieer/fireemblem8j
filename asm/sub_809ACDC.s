	.syntax unified
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_809ACDC, "ax", %progbits
@ sub_809ACDC @ JP 0x0809ACDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809ACDC
	.thumb_func
sub_809ACDC:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	movs r1, #0xa
	movs r2, #6
	movs r3, #0
	bl j_TmFillRect
	ldr r4, _0809AD40 @ =0x02013560
	adds r0, r4, #0
	bl sub_8003CF8
	movs r0, #8
	adds r0, r0, r4
	mov r8, r0
	bl sub_8003CF8
	ldr r0, _0809AD44 @ =0x0000050E
	bl sub_8009FA8
	adds r1, r5, #0
	adds r1, #0x42
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	ldr r0, _0809AD48 @ =0x0000050F
	bl sub_8009FA8
	adds r5, #0xc2
	str r6, [sp]
	str r0, [sp, #4]
	mov r0, r8
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809AD40: .4byte 0x02013560
_0809AD44: .4byte 0x0000050E
_0809AD48: .4byte 0x0000050F

