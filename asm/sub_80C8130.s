	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C8130, "ax", %progbits
@ sub_80C8130 @ JP 0x080C8130 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8130
	.thumb_func
sub_80C8130:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, r2, #0
	cmp r1, #0
	beq _080C8148
	ldr r0, _080C8144 @ =0x08AC2720
	bl Proc_StartBlocking
	b _080C8150
	.align 2, 0
_080C8144: .4byte 0x08AC2720
_080C8148:
	ldr r0, _080C8188 @ =0x08AC2720
	movs r1, #3
	bl sub_8002BCC
_080C8150:
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2a
	strb r5, [r0]
	ldrb r0, [r4]
	strh r0, [r2, #0x2c]
	ldrb r1, [r4, #1]
	adds r0, r2, #0
	adds r0, #0x38
	strb r1, [r0]
	ldrh r1, [r4, #6]
	subs r0, #8
	strb r1, [r0]
	ldrh r1, [r4, #8]
	adds r0, #4
	strb r1, [r0]
	ldrh r0, [r4, #0xa]
	strh r0, [r2, #0x3c]
	ldr r0, [r4, #0xc]
	strh r0, [r2, #0x3a]
	adds r0, r2, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080C8188: .4byte 0x08AC2720

