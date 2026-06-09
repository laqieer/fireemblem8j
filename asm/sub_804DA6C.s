	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_804DA18, 0x0804DA18 + 1
	.section .text.sub_804DA6C, "ax", %progbits
@ sub_804DA6C @ JP 0x0804DA6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804DA6C
	.thumb_func
sub_804DA6C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x2c]
	adds r1, r1, r0
	asrs r1, r1, #1
	ldr r2, [r7, #0x38]
	ldr r0, [r7, #0x30]
	adds r2, r2, r0
	asrs r2, r2, #1
	str r1, [r7, #0x2c]
	str r2, [r7, #0x30]
	ldr r3, _0804DAEC @ =0x085D4B4C
	ldr r0, [r7, #0x3c]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #2
	bl PutSprite
	ldr r1, [r7, #0x40]
	adds r1, #0x60
	ldr r3, _0804DAF0 @ =0x080DF11E
	str r4, [sp]
	movs r0, #2
	movs r2, #0x30
	bl PutSprite
	ldr r3, _0804DAF4 @ =0x085D4A7C
	str r4, [sp]
	movs r0, #2
	movs r1, #0x60
	movs r2, #0x20
	bl PutSprite
	ldr r3, _0804DAF8 @ =0x085D4AF4
	movs r0, #0x80
	lsls r0, r0, #4
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	ldr r6, _0804DAFC @ =0x085D4B54
	movs r5, #0x48
_0804DACE:
	ldr r0, [r7, #0x44]
	cmp r0, r4
	bne _0804DB00
	cmp r4, #2
	bgt _0804DB00
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
	b _0804DB12
	.align 2, 0
_0804DAEC: .4byte 0x085D4B4C
_0804DAF0: .4byte 0x080DF11E
_0804DAF4: .4byte 0x085D4A7C
_0804DAF8: .4byte 0x085D4AF4
_0804DAFC: .4byte 0x085D4B54
_0804DB00:
	ldr r3, [r6]
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0xc4
	adds r2, r5, #0
	bl PutSprite
_0804DB12:
	adds r6, #4
	adds r5, #0x10
	adds r4, #1
	cmp r4, #4
	ble _0804DACE
	bl sub_804DA18
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

