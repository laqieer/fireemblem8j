	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_805C5D8, "ax", %progbits
@ sub_805C5D8 @ JP 0x0805C5D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C5D8
	.thumb_func
sub_805C5D8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	adds r4, r3, #0
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r1, _0805C674 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r6, _0805C678 @ =0x0201FDC4
	ldr r7, _0805C67C @ =0x0201FF04
	ldr r0, _0805C680 @ =0x0201FDBC
	mov sl, r0
	cmp r4, #2
	bne _0805C63A
	ldr r1, _0805C684 @ =0x0201FB38
	movs r0, #0
	adds r5, r1, #0
	ldr r3, _0805C688 @ =0x0201FB2C
	mov ip, r3
	ldr r3, _0805C68C @ =0x0201FB30
	mov r8, r3
	ldr r3, _0805C690 @ =0x0201FB34
	mov sb, r3
_0805C614:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _0805C614
	ldr r1, _0805C694 @ =0x0201FC78
	movs r0, #0
_0805C622:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _0805C622
	movs r0, #0
	mov r1, ip
	str r0, [r1]
	mov r3, r8
	str r5, [r3]
	mov r0, sb
	str r5, [r0]
_0805C63A:
	adds r1, r6, #0
	movs r0, #0
_0805C63E:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _0805C63E
	adds r1, r7, #0
	movs r0, #0
_0805C64C:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _0805C64C
	movs r0, #0
	ldr r1, _0805C698 @ =0x0201FDB8
	str r0, [r1]
	mov r3, sl
	str r6, [r3]
	ldr r0, _0805C69C @ =0x0201FDC0
	str r6, [r0]
	cmp r4, #1
	beq _0805C6AC
	cmp r4, #1
	blo _0805C6A0
	cmp r4, #2
	beq _0805C6B8
	b _0805C6BE
	.align 2, 0
_0805C674: .4byte 0x0201774C
_0805C678: .4byte 0x0201FDC4
_0805C67C: .4byte 0x0201FF04
_0805C680: .4byte 0x0201FDBC
_0805C684: .4byte 0x0201FB38
_0805C688: .4byte 0x0201FB2C
_0805C68C: .4byte 0x0201FB30
_0805C690: .4byte 0x0201FB34
_0805C694: .4byte 0x0201FC78
_0805C698: .4byte 0x0201FDB8
_0805C69C: .4byte 0x0201FDC0
_0805C6A0:
	ldr r0, _0805C6A8 @ =EfxMagicHBlank_0
	bl SetPrimaryHBlankHandler
	b _0805C6BE
	.align 2, 0
_0805C6A8: .4byte 0x0805C4D5  @ EfxMagicHBlank_0
_0805C6AC:
	ldr r0, _0805C6B4 @ =EfxMagicHBlank_1
	bl SetPrimaryHBlankHandler
	b _0805C6BE
	.align 2, 0
_0805C6B4: .4byte 0x0805C501  @ EfxMagicHBlank_1
_0805C6B8:
	ldr r0, _0805C6E4 @ =EfxMagicHBlank_1
	bl SetPrimaryHBlankHandler
_0805C6BE:
	ldr r0, _0805C6E8 @ =0x085FF238
	movs r1, #0
	bl sub_8002BCC
	ldr r1, [sp]
	str r1, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r3, [sp, #4]
	str r3, [r0, #0x44]
	str r4, [r0, #0x48]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805C6E4: .4byte 0x0805C501  @ EfxMagicHBlank_1
_0805C6E8: .4byte 0x085FF238

