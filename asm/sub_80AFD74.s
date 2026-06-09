	.syntax unified
	.set sub_80AF4B8, 0x080AF4B8 + 1
	.set sub_80AF790, 0x080AF790 + 1
	.set sub_80AF964, 0x080AF964 + 1
	.set sub_80AFA40, 0x080AFA40 + 1
	.set sub_80AFB30, 0x080AFB30 + 1
	.set sub_80B0028, 0x080B0028 + 1
	.section .text.sub_80AFD74, "ax", %progbits
@ sub_80AFD74 @ JP 0x080AFD74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AFD74
	.thumb_func
sub_80AFD74:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AFDC0
	ldr r0, [r4, #0x14]
	adds r1, r0, #0
	adds r1, #0x42
	ldrh r2, [r1]
	adds r1, r2, #0
	cmp r1, #0xff
	bhi _080AFDA8
	cmp r1, #0x20
	bne _080AFDA2
	adds r0, #0x35
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x33
	strb r0, [r1]
	b _080AFDA8
_080AFDA2:
	adds r0, r4, #0
	adds r0, #0x33
	strb r2, [r0]
_080AFDA8:
	adds r0, r4, #0
	bl sub_80AF964
	adds r0, r4, #0
	bl sub_80AFA40
	adds r0, r4, #0
	bl sub_80AFB30
	adds r0, r4, #0
	bl sub_80AF790
_080AFDC0:
	adds r0, r4, #0
	bl sub_80AF4B8
	ldrh r0, [r4, #0x2a]
	bl sub_80B0028
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

