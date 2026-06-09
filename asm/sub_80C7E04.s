	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_FindBegin, 0x0800347C + 1
	.set Proc_FindNext, 0x0800348C + 1
	.section .text.sub_80C7E04, "ax", %progbits
@ sub_80C7E04 @ JP 0x080C7E04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7E04
	.thumb_func
sub_80C7E04:
	push {r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	cmp r4, #0
	bge _080C7E24
	ldr r0, _080C7E18 @ =0x08AC26D8
	bl Proc_EndEach
	b _080C7E40
	.align 2, 0
_080C7E18: .4byte 0x08AC26D8
_080C7E1C:
	adds r0, r1, #0
	bl Proc_End
	b _080C7E40
_080C7E24:
	ldr r1, _080C7E48 @ =0x08AC26D8
	mov r0, sp
	bl Proc_FindBegin
_080C7E2C:
	mov r0, sp
	bl Proc_FindNext
	adds r1, r0, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r0, r4
	beq _080C7E1C
	cmp r1, #0
	bne _080C7E2C
_080C7E40:
	add sp, #0xc
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C7E48: .4byte 0x08AC26D8

