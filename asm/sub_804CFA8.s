	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_804CFA8, "ax", %progbits
@ sub_804CFA8 @ JP 0x0804CFA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804CFA8
	.thumb_func
sub_804CFA8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r1, #0
	beq _0804CFD0
	ldr r0, _0804CFCC @ =0x085D4940
	bl Proc_StartBlocking
	b _0804CFD8
	.align 2, 0
_0804CFCC: .4byte 0x085D4940
_0804CFD0:
	ldr r0, _0804CFFC @ =0x085D4940
	movs r1, #2
	bl sub_8002BCC
_0804CFD8:
	adds r1, r0, #0
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	str r7, [r1, #0x34]
	mov r0, r8
	str r0, [r1, #0x38]
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x3c]
	adds r0, r1, #0
	adds r0, #0x41
	strb r4, [r0]
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804CFFC: .4byte 0x085D4940

