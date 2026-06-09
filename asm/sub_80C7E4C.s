	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_FindBegin, 0x0800347C + 1
	.set Proc_FindNext, 0x0800348C + 1
	.section .text.sub_80C7E4C, "ax", %progbits
@ sub_80C7E4C @ JP 0x080C7E4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7E4C
	.thumb_func
sub_80C7E4C:
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C7E68
	ldr r0, _080C7E64 @ =0x08AC26D8
	bl Proc_Find
	cmp r0, #0
	beq _080C7E8E
	movs r0, #1
	b _080C7E8E
	.align 2, 0
_080C7E64: .4byte 0x08AC26D8
_080C7E68:
	ldr r1, _080C7E88 @ =0x08AC26D8
	mov r0, sp
	bl Proc_FindBegin
_080C7E70:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, r4
	beq _080C7E8C
	cmp r1, #0
	bne _080C7E70
	movs r0, #0
	b _080C7E8E
	.align 2, 0
_080C7E88: .4byte 0x08AC26D8
_080C7E8C:
	movs r0, #1
_080C7E8E:
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

