	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_FindBegin, 0x0800347C + 1
	.set Proc_FindNext, 0x0800348C + 1
	.section .text.sub_80C823C, "ax", %progbits
@ IsGmAutoMuActiveFor @ JP 0x080C823C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsGmAutoMuActiveFor
	.thumb_func
IsGmAutoMuActiveFor:
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C8258
	ldr r0, _080C8254 @ =0x08AC2720
	bl Proc_Find
	cmp r0, #0
	beq _080C827E
	movs r0, #1
	b _080C827E
	.align 2, 0
_080C8254: .4byte 0x08AC2720
_080C8258:
	ldr r1, _080C8278 @ =0x08AC2720
	mov r0, sp
	bl Proc_FindBegin
_080C8260:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	cmp r0, r4
	beq _080C827C
	cmp r1, #0
	bne _080C8260
	movs r0, #0
	b _080C827E
	.align 2, 0
_080C8278: .4byte 0x08AC2720
_080C827C:
	movs r0, #1
_080C827E:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

