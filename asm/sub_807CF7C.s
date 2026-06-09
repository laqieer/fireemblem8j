	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set SetMuPal, 0x0807BF80 + 1
	.set sub_807BF2C, 0x0807BF2C + 1
	.section .text.sub_807CF7C, "ax", %progbits
@ sub_807CF7C @ JP 0x0807CF7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CF7C
	.thumb_func
sub_807CF7C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _0807CFFC @ =0x0203E1EC
	ldr r0, [r2]
	movs r1, #0xb
	ldrsb r1, [r0, r1]
	movs r3, #0xc0
	ands r1, r3
	ldr r0, [r2, #0x14]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ands r0, r3
	adds r4, r2, #0
	cmp r1, r0
	bne _0807CFB8
	ldr r0, [r4, #4]
	adds r0, #0x55
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0807CFB8
	cmp r0, #0x33
	beq _0807CFB8
	ldr r0, [r4, #0x18]
	adds r0, #0x55
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0807CFB8
	cmp r0, #0x33
	bne _0807CFF4
_0807CFB8:
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r5, r0, #2
	adds r0, r5, r4
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x3c
	bne _0807CFF4
	adds r0, r4, #4
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xaa
	bne _0807CFF4
	adds r4, #8
	adds r4, r5, r4
	ldr r0, [r4]
	adds r1, r6, #0
	adds r1, #8
	bl SetMuPal
	ldr r0, [r4]
	ldr r2, _0807D000 @ =0x08A195FC
	movs r1, #0xe
	bl sub_807BF2C
_0807CFF4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807CFFC: .4byte 0x0203E1EC
_0807D000: .4byte 0x08A195FC

