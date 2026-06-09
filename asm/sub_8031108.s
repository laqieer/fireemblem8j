	.syntax unified
	.set BMapVSync_Start, 0x080300A0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8031108, "ax", %progbits
@ sub_8031108 @ JP 0x08031108 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031108
	.thumb_func
sub_8031108:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08031134 @ =0x085C2670
	movs r1, #2
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x54]
	adds r4, #0x28
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	bl BMapVSync_Start
	ldr r0, _08031138 @ =0x085C5DE8
	movs r1, #4
	bl sub_8002BCC
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08031134: .4byte 0x085C2670
_08031138: .4byte 0x085C5DE8

