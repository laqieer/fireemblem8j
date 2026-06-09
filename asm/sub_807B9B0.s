	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_8037B04, 0x08037B04 + 1
	.set sub_807BE88, 0x0807BE88 + 1
	.section .text.sub_807B9B0, "ax", %progbits
@ sub_807B9B0 @ JP 0x0807B9B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B9B0
	.thumb_func
sub_807B9B0:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x3f
	movs r4, #0
	movs r0, #7
	strb r0, [r1]
	ldr r0, _0807BA24 @ =0x08A13308
	adds r1, r5, #0
	bl sub_8002BCC
	str r5, [r0, #0x54]
	adds r0, #0x64
	movs r1, #0x20
	strh r1, [r0]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r0, [r5, #0x30]
	strh r4, [r0, #0x18]
	ldr r0, [r5, #0x30]
	strh r4, [r0, #0x1a]
	adds r0, r5, #0
	movs r1, #0
	bl sub_807BE88
	ldr r1, [r5, #0x30]
	movs r0, #0xd
	strh r0, [r1, #0x1e]
	ldr r0, _0807BA28 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807BA02
	movs r0, #0xd6
	bl m4aSongNumStart
_0807BA02:
	ldr r2, [r5, #0x2c]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0807BA1C
	adds r0, r2, #0
	bl sub_8037B04
	ldr r0, [r5, #0x2c]
	bl sub_80280A0
_0807BA1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807BA24: .4byte 0x08A13308
_0807BA28: .4byte 0x0202BCEC

