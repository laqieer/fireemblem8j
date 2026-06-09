	.syntax unified
	.set IsGameNotFirstChapter, 0x080A9CD4 + 1
	.set sub_80A9C30, 0x080A9C30 + 1
	.set sub_80A9C44, 0x080A9C44 + 1
	.section .text.sub_80479D0, "ax", %progbits
@ sub_80479D0 @ JP 0x080479D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80479D0
	.thumb_func
sub_80479D0:
	push {r4, lr}
	sub sp, #0x4c
	movs r4, #0
_080479D6:
	adds r0, r4, #0
	bl sub_80A9C30
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080479FA
	adds r0, r4, #0
	mov r1, sp
	bl sub_80A9C44
	mov r0, sp
	bl IsGameNotFirstChapter
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080479FA
	movs r0, #1
	b _08047A02
_080479FA:
	adds r4, #1
	cmp r4, #2
	ble _080479D6
	movs r0, #0
_08047A02:
	add sp, #0x4c
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

