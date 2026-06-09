	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set FlipBgVerticalScroll, 0x08014ED0 + 1
	.set GetBgVerticalScrollBuffer, 0x08014E9C + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_80AF4B8, "ax", %progbits
@ sub_80AF4B8 @ JP 0x080AF4B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AF4B8
	.thumb_func
sub_80AF4B8:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldrh r1, [r0, #0x3e]
	adds r1, #1
	strh r1, [r0, #0x3e]
	adds r2, r0, #0
	adds r2, #0x40
	ldrh r1, [r2]
	adds r1, #2
	strh r1, [r2]
	ldrh r0, [r0, #0x3e]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x17
	mov r8, r0
	ldrh r0, [r2]
	lsrs r7, r0, #3
	movs r0, #0xff
	ands r7, r0
	movs r0, #0
	movs r1, #1
	bl GetBgVerticalScrollBuffer
	adds r5, r7, #0
	ldr r1, _080AF538 @ =0x080DC15C
	mov sb, r1
	adds r4, r0, #0
	movs r6, #0x9f
_080AF4F2:
	movs r0, #0xff
	ands r0, r5
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	movs r1, #0xc0
	lsls r1, r1, #2
	bl __divsi3
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add r0, r8
	ldr r2, _080AF53C @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	strh r0, [r4]
	adds r5, #0xc
	adds r4, #2
	subs r6, #1
	cmp r6, #0
	bge _080AF4F2
	mov r1, r8
	adds r2, r7, #0
	movs r0, #2
	bl BG_SetPosition
	bl FlipBgVerticalScroll
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AF538: .4byte 0x080DC15C
_080AF53C: .4byte 0x000001FF

