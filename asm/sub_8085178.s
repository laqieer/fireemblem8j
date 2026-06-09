	.syntax unified
	.set InitScanlineBuf, 0x080846E0 + 1
	.set SwapScanlineBufs, 0x080846D0 + 1
	.set sub_8084F88, 0x08084F88 + 1
	.section .text.sub_8085178, "ax", %progbits
@ sub_8085178 @ JP 0x08085178 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085178
	.thumb_func
sub_8085178:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	adds r5, r3, #0
	ldr r4, _080851B4 @ =0x0203E750
	ldr r0, [r4, #4]
	bl InitScanlineBuf
	ldr r0, [r4, #4]
	str r5, [sp]
	adds r1, r6, #0
	mov r2, r8
	mov r3, sb
	bl sub_8084F88
	bl SwapScanlineBufs
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080851B4: .4byte 0x0203E750

