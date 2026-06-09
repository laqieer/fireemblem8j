	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_FindBegin, 0x0800347C + 1
	.set Proc_FindNext, 0x0800348C + 1
	.section .text.sub_80C81F4, "ax", %progbits
@ sub_80C81F4 @ JP 0x080C81F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C81F4
	.thumb_func
sub_80C81F4:
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C8214
	ldr r0, _080C8208 @ =0x08AC2720
	bl Proc_EndEach
	b _080C822E
	.align 2, 0
_080C8208: .4byte 0x08AC2720
_080C820C:
	adds r0, r1, #0
	bl Proc_End
	b _080C822E
_080C8214:
	ldr r1, _080C8238 @ =0x08AC2720
	mov r0, sp
	bl Proc_FindBegin
_080C821C:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	ldrh r0, [r1, #0x2c]
	cmp r0, r4
	beq _080C820C
	cmp r1, #0
	bne _080C821C
_080C822E:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C8238: .4byte 0x08AC2720

