	.syntax unified
	.set Proc_FindBegin, 0x0800347C + 1
	.set Proc_FindNext, 0x0800348C + 1
	.section .text.sub_80C79C8, "ax", %progbits
@ sub_80C79C8 @ JP 0x080C79C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C79C8
	.thumb_func
sub_80C79C8:
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r1, _080C79F4 @ =0x08AC2608
	mov r0, sp
	bl Proc_FindBegin
	movs r5, #1
_080C79D8:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	cmp r4, #0
	blt _080C79F8
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, r4
	bne _080C79FE
	adds r0, r1, #0
	adds r0, #0x29
	strb r5, [r0]
	b _080C7A02
	.align 2, 0
_080C79F4: .4byte 0x08AC2608
_080C79F8:
	adds r0, r1, #0
	adds r0, #0x29
	strb r5, [r0]
_080C79FE:
	cmp r1, #0
	bne _080C79D8
_080C7A02:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

