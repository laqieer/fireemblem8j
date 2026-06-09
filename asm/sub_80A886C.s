	.syntax unified
	.set sub_80A88E8, 0x080A88E8 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80A886C, "ax", %progbits
@ sub_80A886C @ JP 0x080A886C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A886C
	.thumb_func
sub_80A886C:
	push {lr}
	sub sp, #0x28
	add r0, sp, #0x24
	movs r1, #0
	strh r1, [r0]
	ldr r2, _080A888C @ =0x01000012
	mov r1, sp
	bl sub_80D6370
	mov r0, sp
	bl sub_80A88E8
	add sp, #0x28
	pop {r0}
	bx r0
	.align 2, 0
_080A888C: .4byte 0x01000012

