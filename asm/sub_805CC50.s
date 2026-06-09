	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_805B094, 0x0805B094 + 1
	.section .text.sub_805CC50, "ax", %progbits
@ sub_805CC50 @ JP 0x0805CC50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805CC50
	.thumb_func
sub_805CC50:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805CC76
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	b _0805CC9A
_0805CC76:
	cmp r0, #0xa
	bne _0805CC9A
	adds r0, r4, #0
	bl sub_805B094
	lsls r0, r0, #0x10
	ldr r1, _0805CCA0 @ =0xFFFF0000
	cmp r0, r1
	beq _0805CC90
	ldrh r0, [r4, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
_0805CC90:
	bl SpellFx_Finish
	adds r0, r5, #0
	bl sub_8002DE4
_0805CC9A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805CCA0: .4byte 0xFFFF0000

