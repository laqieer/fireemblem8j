	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_80C94A8, "ax", %progbits
@ sub_80C94A8 @ JP 0x080C94A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C94A8
	.thumb_func
sub_80C94A8:
	push {lr}
	ldr r2, _080C94E8 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bl SetDefaultColorEffects
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080C94EC @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #8
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080C94E8: .4byte 0x03003020
_080C94EC: .4byte 0x020244A8

