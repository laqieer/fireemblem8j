	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80148F0, "ax", %progbits
@ sub_80148F0 @ JP 0x080148F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80148F0
	.thumb_func
sub_80148F0:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08014908 @ =0x085C2580
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x2c]
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08014908: .4byte 0x085C2580

