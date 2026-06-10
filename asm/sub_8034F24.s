	.syntax unified
	.set GetUnitInfoWindowX, 0x080348DC + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8034744, 0x08034744 + 1
	.set sub_8034904, 0x08034904 + 1
	.set sub_8034A18, 0x08034A18 + 1
	.section .text.sub_8034F24, "ax", %progbits
@ sub_8034F24 @ JP 0x08034F24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034F24
	.thumb_func
sub_8034F24:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	mov r8, r0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #0
	bl sub_8034744
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x38
	adds r0, r6, #0
	mov r1, r8
	bl sub_8034904
	adds r1, r4, #0
	adds r1, #0x61
	lsls r1, r1, #1
	ldr r0, _08034F94 @ =0x02022CA8
	mov sb, r0
	add r1, sb
	adds r0, r6, #0
	bl PutText
	adds r5, #0x40
	adds r0, r5, #0
	mov r1, r8
	bl sub_8034A18
	adds r4, #0xa1
	lsls r4, r4, #1
	add r4, sb
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034F94: .4byte 0x02022CA8

