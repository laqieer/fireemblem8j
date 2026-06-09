	.syntax unified
	.set sub_80A8A44, 0x080A8A44 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80A89C8, "ax", %progbits
@ sub_80A89C8 @ JP 0x080A89C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A89C8
	.thumb_func
sub_80A89C8:
	push {lr}
	sub sp, #0x18
	add r0, sp, #0x14
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080A89E8 @ =0x0100000A
	mov r1, sp
	bl sub_80D6370
	mov r0, sp
	bl sub_80A8A44
	add sp, #0x18
	pop {r0}
	bx r0
	.align 2, 0
_080A89E8: .4byte 0x0100000A

