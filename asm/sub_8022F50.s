	.syntax unified
	.set sub_8025280, 0x08025280 + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8022F50, "ax", %progbits
@ sub_8022F50 @ JP 0x08022F50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022F50
	.thumb_func
sub_8022F50:
	push {lr}
	bl sub_804F610
	ldr r0, _08022F6C @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8025280
	ldr r0, _08022F70 @ =0x085C58B8
	bl sub_80507B0
	movs r0, #7
	pop {r1}
	bx r1
	.align 2, 0
_08022F6C: .4byte 0x03004DF0
_08022F70: .4byte 0x085C58B8

