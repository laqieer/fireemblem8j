	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8039248, "ax", %progbits
@ sub_8039248 @ JP 0x08039248 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8039248
	.thumb_func
sub_8039248:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _08039260
	ldr r0, _0803925C @ =0x085C6D2C
	bl Proc_StartBlocking
	b _08039268
	.align 2, 0
_0803925C: .4byte 0x085C6D2C
_08039260:
	ldr r0, _08039274 @ =0x085C6D2C
	movs r1, #3
	bl sub_8002BCC
_08039268:
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08039274: .4byte 0x085C6D2C

