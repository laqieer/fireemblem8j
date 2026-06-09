	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8053A7C, "ax", %progbits
@ sub_8053A7C @ JP 0x08053A7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053A7C
	.thumb_func
sub_8053A7C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08053AA0 @ =0x02017728
	ldr r4, [r1]
	cmp r4, #0
	bne _08053A98
	movs r0, #1
	str r0, [r1]
	ldr r0, _08053AA4 @ =0x085E38D4
	movs r1, #3
	bl sub_8002BCC
	strh r4, [r0, #0x2c]
	str r5, [r0, #0x64]
_08053A98:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053AA0: .4byte 0x02017728
_08053AA4: .4byte 0x085E38D4

