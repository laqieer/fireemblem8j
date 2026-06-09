	.syntax unified
	.set sub_807ACBC, 0x0807ACBC + 1
	.set sub_807B70C, 0x0807B70C + 1
	.set sub_807B7B8, 0x0807B7B8 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_807B444, "ax", %progbits
@ sub_807B444 @ JP 0x0807B444 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B444
	.thumb_func
sub_807B444:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	cmp r1, #0
	beq _0807B47C
	adds r0, #9
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807B468
	subs r0, r1, #2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0807B468
	adds r0, r4, #0
	bl sub_807ACBC
_0807B468:
	ldr r0, _0807B494 @ =0x08A132B0
	adds r1, r4, #0
	adds r1, #0x3f
	ldrb r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r1, [r1]
	adds r0, r4, #0
	bl sub_80D65C0
_0807B47C:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xf
	bne _0807B498
	adds r0, r4, #0
	bl sub_807B70C
	b _0807B49E
	.align 2, 0
_0807B494: .4byte 0x08A132B0
_0807B498:
	adds r0, r4, #0
	bl sub_807B7B8
_0807B49E:
	pop {r4}
	pop {r0}
	bx r0

