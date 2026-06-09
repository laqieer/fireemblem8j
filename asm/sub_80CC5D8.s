	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80CB720, 0x080CB720 + 1
	.set sub_80CB7D8, 0x080CB7D8 + 1
	.section .text.sub_80CC5D8, "ax", %progbits
@ sub_80CC5D8 @ JP 0x080CC5D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC5D8
	.thumb_func
sub_80CC5D8:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	movs r0, #7
	bl BG_EnableSyncByMask
	ldrh r0, [r5, #0x2a]
	cmp r0, #0x10
	bhi _080CC6CA
	adds r3, r0, #0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x80
	bl sub_8012E84
	adds r6, r0, #0
	ldrh r0, [r5, #0x2a]
	subs r0, #0xc
	cmp r0, #4
	bhi _080CC680
	lsls r0, r0, #2
	ldr r1, _080CC614 @ =_080CC618
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CC614: .4byte _080CC618
_080CC618: @ jump table
	.4byte _080CC62C @ case 0
	.4byte _080CC640 @ case 1
	.4byte _080CC660 @ case 2
	.4byte _080CC680 @ case 3
	.4byte _080CC6A0 @ case 4
_080CC62C:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080CC63C @ =0x0600C800
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	b _080CC692
	.align 2, 0
_080CC63C: .4byte 0x0600C800
_080CC640:
	ldr r0, _080CC654 @ =0x08B55BF4
	ldr r1, _080CC658 @ =0x06008000
	bl sub_8013008
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	ldr r2, _080CC65C @ =0x0600C800
	b _080CC68A
	.align 2, 0
_080CC654: .4byte 0x08B55BF4
_080CC658: .4byte 0x06008000
_080CC65C: .4byte 0x0600C800
_080CC660:
	ldr r0, _080CC678 @ =0x08B56B3C
	ldr r4, _080CC67C @ =0x0600C000
	adds r1, r4, #0
	bl sub_8013008
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	str r4, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	b _080CC692
	.align 2, 0
_080CC678: .4byte 0x08B56B3C
_080CC67C: .4byte 0x0600C000
_080CC680:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x30
	ldrsh r1, [r5, r2]
	ldr r2, _080CC69C @ =0x0600C000
_080CC68A:
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
_080CC692:
	movs r2, #0x88
	movs r3, #2
	bl sub_80CB720
	b _080CC6C8
	.align 2, 0
_080CC69C: .4byte 0x0600C000
_080CC6A0:
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	ldr r1, _080CC734 @ =0x02021188
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r2, #0x88
	movs r3, #2
	bl sub_80CB720
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #2
	bl SetBackgroundTileDataOffset
	ldr r0, _080CC738 @ =0x08B3F628
	adds r1, r5, #0
	bl sub_8002BCC
_080CC6C8:
	strh r6, [r5, #0x30]
_080CC6CA:
	ldrh r0, [r5, #0x2a]
	subs r4, r0, #5
	cmp r4, #0
	blt _080CC740
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x90
	adds r3, r4, #0
	bl sub_8012E84
	adds r6, r0, #0
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	movs r2, #0x32
	ldrsh r1, [r5, r2]
	ldr r7, _080CC73C @ =0x02020188
	str r7, [sp]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r2, r2, r7
	mov sb, r2
	str r2, [sp, #4]
	movs r2, #1
	str r2, [sp, #8]
	movs r2, #0xc8
	movs r3, #1
	bl sub_80CB7D8
	movs r0, #0
	mov r8, r0
	strh r6, [r5, #0x32]
	cmp r4, #0x10
	bne _080CC740
	movs r1, #0x32
	ldrsh r0, [r5, r1]
	str r7, [sp]
	mov r2, sb
	str r2, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	movs r1, #0
	movs r2, #0xc8
	movs r3, #0
	bl sub_80CB7D8
	mov r2, r8
	strh r2, [r5, #0x2a]
	adds r0, r5, #0
	bl sub_8002DE4
	b _080CC746
	.align 2, 0
_080CC734: .4byte 0x02021188
_080CC738: .4byte 0x08B3F628
_080CC73C: .4byte 0x02020188
_080CC740:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
_080CC746:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

