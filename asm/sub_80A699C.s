	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.section .text.sub_80A699C, "ax", %progbits
@ sub_80A699C @ JP 0x080A699C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A699C
	.thumb_func
sub_80A699C:
	push {lr}
	sub sp, #4
	adds r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A69BA
	movs r2, #0x80
	lsls r2, r2, #1
	str r0, [sp]
	movs r0, #9
	movs r1, #0x80
	movs r3, #0x10
	bl ChangeBgm
	b _080A69CC
_080A69BA:
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	adds r1, r2, #0
	movs r3, #0x10
	bl ChangeBgm
_080A69CC:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

