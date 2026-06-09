	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80B7C4C, 0x080B7C4C + 1
	.set sub_80B7E4C, 0x080B7E4C + 1
	.section .text.sub_80B7A18, "ax", %progbits
@ sub_80B7A18 @ JP 0x080B7A18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7A18
	.thumb_func
sub_80B7A18:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x3c
	bne _080B7A36
	ldr r0, [r4, #0x64]
	ldrb r1, [r0, #0xe]
	adds r0, r4, #0
	bl sub_80B7E4C
	str r0, [r4, #0x5c]
	ldr r0, _080B7A48 @ =0x08AAFD9C
	adds r1, r4, #0
	bl sub_8002BCC
_080B7A36:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x5f
	bls _080B7A4C
	adds r0, r4, #0
	bl sub_8002DE4
	movs r0, #0
	b _080B7A8E
	.align 2, 0
_080B7A48: .4byte 0x08AAFD9C
_080B7A4C:
	cmp r0, #0xf
	bls _080B7A8A
	ldrh r1, [r4, #0x2a]
	adds r6, r1, #0
	subs r6, #0x10
	movs r0, #3
	ands r0, r6
	cmp r0, #0
	bne _080B7A8A
	adds r0, r6, #0
	cmp r6, #0
	bge _080B7A68
	adds r0, r1, #0
	subs r0, #0xd
_080B7A68:
	asrs r0, r0, #2
	adds r5, r0, #1
	ldr r0, [r4, #0x64]
	ldrb r0, [r0, #0xc]
	cmp r5, r0
	bge _080B7A8A
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_80B7C4C
	adds r2, r0, #0
	lsls r1, r5, #2
	adds r0, r4, #0
	adds r0, #0x34
	adds r0, r0, r1
	str r2, [r0]
_080B7A8A:
	ldrh r0, [r4, #0x2a]
	adds r0, #1
_080B7A8E:
	strh r0, [r4, #0x2a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

