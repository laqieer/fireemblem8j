	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_FindBegin, 0x0800347C + 1
	.set Proc_FindNext, 0x0800348C + 1
	.section .text.sub_80C797C, "ax", %progbits
@ sub_80C797C @ JP 0x080C797C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C797C
	.thumb_func
sub_80C797C:
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C7998
	ldr r0, _080C7994 @ =0x08AC2608
	bl Proc_Find
	cmp r0, #0
	beq _080C79BE
	movs r0, #1
	b _080C79BE
	.align 2, 0
_080C7994: .4byte 0x08AC2608
_080C7998:
	ldr r1, _080C79B8 @ =0x08AC2608
	mov r0, sp
	bl Proc_FindBegin
_080C79A0:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, r4
	beq _080C79BC
	cmp r1, #0
	bne _080C79A0
	movs r0, #0
	b _080C79BE
	.align 2, 0
_080C79B8: .4byte 0x08AC2608
_080C79BC:
	movs r0, #1
_080C79BE:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

