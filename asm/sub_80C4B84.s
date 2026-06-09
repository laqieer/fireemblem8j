	.syntax unified
	.set FlipWorldMapHblankBuffer, 0x080C6B84 + 1
	.set GetWorldMapHblankBuffer, 0x080C6B5C + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_80C4B84, "ax", %progbits
@ sub_80C4B84 @ JP 0x080C4B84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4B84
	.thumb_func
sub_80C4B84:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r6, r0, #0
	movs r0, #0
	movs r1, #1
	bl GetWorldMapHblankBuffer
	str r0, [sp]
	movs r0, #1
	movs r1, #1
	bl GetWorldMapHblankBuffer
	str r0, [sp, #4]
	movs r3, #0
	movs r7, #0x40
	ldr r0, _080C4CD8 @ =0x000001FF
	adds r5, r0, #0
	movs r4, #0
	ldr r2, [sp, #4]
	ldr r1, [sp]
_080C4BB4:
	subs r0, r7, r3
	ands r0, r5
	strh r0, [r1]
	strh r4, [r2]
	adds r2, #2
	adds r1, #2
	adds r3, #1
	cmp r3, #0x9f
	ble _080C4BB4
	movs r3, #0
	movs r1, #0x2a
	adds r1, r1, r6
	mov r8, r1
	adds r6, #0x2b
	str r6, [sp, #0xc]
	ldrb r2, [r1]
	cmp r3, r2
	bge _080C4C44
	ldr r0, [sp, #4]
	mov sl, r0
	ldr r1, [sp]
	mov sb, r1
_080C4BE0:
	mov r2, r8
	str r2, [sp, #8]
	ldrb r1, [r2]
	movs r0, #0x10
	subs r0, r0, r1
	mov r1, sb
	strh r0, [r1]
	ldrb r5, [r2]
	subs r4, r5, r3
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #1
	rsbs r0, r0, #0
	adds r1, r5, #0
	str r3, [sp, #0x18]
	bl __divsi3
	adds r6, r0, #0
	adds r6, #0xd
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #1
	rsbs r0, r0, #0
	adds r1, r5, #0
	bl __divsi3
	adds r7, r0, #0
	adds r7, #0x11
	lsls r0, r4, #3
	subs r4, r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	bl __divsi3
	adds r0, #0x17
	lsls r0, r0, #0xa
	lsls r1, r7, #5
	adds r0, r0, r1
	adds r0, r0, r6
	mov r2, sl
	strh r0, [r2]
	movs r0, #2
	add sl, r0
	add sb, r0
	ldr r3, [sp, #0x18]
	adds r3, #1
	ldr r1, [sp, #8]
	ldrb r1, [r1]
	cmp r3, r1
	blt _080C4BE0
_080C4C44:
	movs r3, #0
	ldr r2, [sp, #0xc]
	mov r8, r2
	ldrb r0, [r2]
	cmp r3, r0
	bge _080C4CC4
	movs r1, #0
	str r1, [sp, #0x10]
	movs r2, #0
	str r2, [sp, #0x14]
	mov sl, r2
_080C4C5A:
	mov sb, r8
	mov r1, r8
	ldrb r0, [r1]
	subs r1, r0, r3
	movs r4, #0xa0
	subs r4, r4, r1
	lsls r4, r4, #1
	ldr r2, [sp]
	adds r1, r4, r2
	adds r0, #0xc8
	strh r0, [r1]
	mov r0, r8
	ldrb r5, [r0]
	mov r0, sl
	adds r1, r5, #0
	str r3, [sp, #0x18]
	bl __divsi3
	adds r6, r0, #0
	adds r6, #0xd
	ldr r0, [sp, #0x14]
	adds r1, r5, #0
	bl __divsi3
	adds r7, r0, #0
	adds r7, #0x11
	ldr r0, [sp, #0x10]
	adds r1, r5, #0
	bl __divsi3
	adds r0, #0x17
	ldr r1, [sp, #4]
	adds r4, r4, r1
	lsls r0, r0, #0xa
	lsls r1, r7, #5
	adds r0, r0, r1
	adds r0, r0, r6
	strh r0, [r4]
	ldr r2, [sp, #0x10]
	subs r2, #7
	str r2, [sp, #0x10]
	ldr r0, [sp, #0x14]
	subs r0, #0xa
	str r0, [sp, #0x14]
	movs r1, #6
	rsbs r1, r1, #0
	add sl, r1
	ldr r3, [sp, #0x18]
	adds r3, #1
	mov r2, sb
	ldrb r2, [r2]
	cmp r3, r2
	blt _080C4C5A
_080C4CC4:
	bl FlipWorldMapHblankBuffer
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C4CD8: .4byte 0x000001FF

