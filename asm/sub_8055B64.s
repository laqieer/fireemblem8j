	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8055B64, "ax", %progbits
@ sub_8055B64 @ JP 0x08055B64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055B64
	.thumb_func
sub_8055B64:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r0, _08055B98 @ =0x085E3C3C
	movs r1, #3
	bl sub_8002BCC
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _08055B9C @ =0x080DFCF6
	str r1, [r0, #0x48]
	str r2, [r0, #0x4c]
	str r2, [r0, #0x50]
	str r4, [r0, #0x54]
	str r5, [r0, #0x58]
	ldr r1, _08055BA0 @ =0x02017774
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08055B98: .4byte 0x085E3C3C
_08055B9C: .4byte 0x080DFCF6
_08055BA0: .4byte 0x02017774

