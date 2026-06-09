	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8053AC4, "ax", %progbits
@ sub_8053AC4 @ JP 0x08053AC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8053AC4
	.thumb_func
sub_8053AC4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08053AE4 @ =0x085E3904
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	ldr r1, _08053AE8 @ =0x02017738
	movs r0, #1
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08053AE4: .4byte 0x085E3904
_08053AE8: .4byte 0x02017738

