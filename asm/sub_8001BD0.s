	.syntax unified
	.set sub_080D63AC, 0x080D63AC + 1
	.section .text.sub_8001BD0, "ax", %progbits
@ sub_8001BD0 @ JP 0x08001BD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001BD0
	.thumb_func
sub_8001BD0:
	push {lr}
	ldr r0, _08001BE8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	ldr r0, _08001BEC @ =0x00000303
	cmp r1, r0
	bne _08001BF0
	movs r0, #0xff
	bl sub_080D63AC
	b _08001BFA
	.align 2, 0
_08001BE8: .4byte 0x085775CC
_08001BEC: .4byte 0x00000303
_08001BF0:
	cmp r1, #0xf
	bne _08001BFA
	movs r0, #0xff
	bl sub_080D63AC
_08001BFA:
	pop {r0}
	bx r0
	.align 2, 0

