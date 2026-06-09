	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80144A4, "ax", %progbits
@ sub_80144A4 @ JP 0x080144A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80144A4
	.thumb_func
sub_80144A4:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	mov r8, r1
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r1, [sp, #0x14]
	ldr r0, _080144DC @ =0x085C2578
	bl sub_8002BCC
	str r5, [r0, #0x2c]
	movs r2, #0
	mov r1, r8
	strh r1, [r0, #0x30]
	lsrs r1, r4, #0x1f
	adds r4, r4, r1
	asrs r4, r4, #1
	strh r4, [r0, #0x32]
	strh r6, [r0, #0x36]
	strh r6, [r0, #0x34]
	strh r2, [r0, #0x38]
	strh r2, [r0, #0x3a]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080144DC: .4byte 0x085C2578

