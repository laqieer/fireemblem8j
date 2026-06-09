	.syntax unified
	.set SetTextFontGlyphs, 0x08003C24 + 1
	.set sub_8003E6C, 0x08003E6C + 1
	.section .text.sub_809162C, "ax", %progbits
@ sub_809162C @ JP 0x0809162C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809162C
	.thumb_func
sub_809162C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	movs r6, #0
	ldrb r5, [r7]
	movs r0, #1
	bl SetTextFontGlyphs
_08091644:
	ldrb r0, [r4]
	cmp r0, #7
	bgt _08091666
	cmp r0, #4
	bge _08091678
	cmp r0, #1
	beq _0809167C
	cmp r0, #1
	bgt _0809165C
	cmp r0, #0
	beq _08091698
	b _08091688
_0809165C:
	cmp r0, #2
	beq _08091678
	cmp r0, #3
	beq _08091698
	b _08091688
_08091666:
	cmp r0, #0x19
	ble _08091670
	cmp r0, #0x80
	beq _08091684
	b _08091688
_08091670:
	cmp r0, #0x18
	bge _08091698
	cmp r0, #0x16
	blt _08091688
_08091678:
	adds r4, #1
	b _08091644
_0809167C:
	adds r4, #1
	adds r5, #0x10
	movs r6, #0
	b _08091644
_08091684:
	adds r4, #2
	b _08091644
_08091688:
	adds r0, r4, #0
	mov r1, sp
	bl sub_8003E6C
	adds r4, r0, #0
	ldr r0, [sp]
	adds r6, r6, r0
	b _08091644
_08091698:
	mov r0, r8
	strb r6, [r0]
	strb r5, [r7]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

