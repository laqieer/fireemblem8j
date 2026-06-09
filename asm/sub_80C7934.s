	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_FindBegin, 0x0800347C + 1
	.set Proc_FindNext, 0x0800348C + 1
	.section .text.sub_80C7934, "ax", %progbits
@ sub_80C7934 @ JP 0x080C7934 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7934
	.thumb_func
sub_80C7934:
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C7954
	ldr r0, _080C7948 @ =0x08AC2608
	bl Proc_EndEach
	b _080C7970
	.align 2, 0
_080C7948: .4byte 0x08AC2608
_080C794C:
	adds r0, r1, #0
	bl Proc_End
	b _080C7970
_080C7954:
	ldr r1, _080C7978 @ =0x08AC2608
	mov r0, sp
	bl Proc_FindBegin
_080C795C:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, r4
	beq _080C794C
	cmp r1, #0
	bne _080C795C
_080C7970:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7978: .4byte 0x08AC2608

