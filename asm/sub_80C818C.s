	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C818C, "ax", %progbits
@ StartGmapAutoMu_Type1 @ JP 0x080C818C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartGmapAutoMu_Type1
	.thumb_func
StartGmapAutoMu_Type1:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080C81A4
	ldr r0, _080C81A0 @ =0x08AC2720
	bl Proc_StartBlocking
	b _080C81AC
	.align 2, 0
_080C81A0: .4byte 0x08AC2720
_080C81A4:
	ldr r0, _080C81F0 @ =0x08AC2720
	movs r1, #3
	bl sub_8002BCC
_080C81AC:
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2a
	strb r5, [r0]
	ldrb r0, [r4]
	strh r0, [r2, #0x2c]
	ldrb r0, [r4, #1]
	adds r1, #0x10
	strb r0, [r1]
	ldrb r1, [r4, #2]
	adds r0, r2, #0
	adds r0, #0x38
	strb r1, [r0]
	ldrh r0, [r4, #6]
	strh r0, [r2, #0x30]
	ldrh r0, [r4, #8]
	strh r0, [r2, #0x32]
	ldrh r0, [r4, #0xa]
	strh r0, [r2, #0x34]
	ldrh r0, [r4, #0xc]
	strh r0, [r2, #0x36]
	ldrh r0, [r4, #0xe]
	strh r0, [r2, #0x3c]
	ldr r0, [r4, #0x10]
	strh r0, [r2, #0x3a]
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C81F0: .4byte 0x08AC2720

