	.syntax unified
	.set RegisterSioPid, 0x080975CC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_809C84C, 0x0809C84C + 1
	.section .text.sub_809CE9C, "ax", %progbits
@ sub_809CE9C @ JP 0x0809CE9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809CE9C
	.thumb_func
sub_809CE9C:
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	adds r0, #0x2a
	adds r3, r4, #0
	adds r3, #0x29
	ldrb r1, [r3]
	ldrb r0, [r0]
	cmp r0, r1
	bls _0809CEEC
	adds r0, r1, #1
	strb r0, [r3]
	ldr r0, [r2, #0xc]
	movs r1, #0xb
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	bl RegisterSioPid
	ldr r0, _0809CEE8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CED8
	movs r0, #0x6a
	bl m4aSongNumStart
_0809CED8:
	ldrh r1, [r4, #0x2e]
	lsrs r1, r1, #1
	adds r0, r4, #0
	bl sub_809C84C
	movs r0, #1
	b _0809CF00
	.align 2, 0
_0809CEE8: .4byte 0x0202BCEC
_0809CEEC:
	ldr r0, _0809CF08 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809CEFE
	movs r0, #0x6c
	bl m4aSongNumStart
_0809CEFE:
	movs r0, #0
_0809CF00:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0809CF08: .4byte 0x0202BCEC

