	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_801B7B8, "ax", %progbits
@ sub_801B7B8 @ JP 0x0801B7B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B7B8
	.thumb_func
sub_801B7B8:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r5, r0, #0
	adds r6, r1, #0
	mov r8, r2
	adds r4, r3, #0
	ldr r0, _0801B7E4 @ =0x085C2EE4
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	str r4, [r0, #0x54]
	adds r0, #0x52
	mov r1, r8
	strh r1, [r0]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B7E4: .4byte 0x085C2EE4

