	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set StartBgmExt, 0x08002434 + 1
	.section .text.sub_80CB370, "ax", %progbits
@ sub_80CB370 @ JP 0x080CB370 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB370
	.thumb_func
sub_80CB370:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080CB38C @ =0x08B3F024
	bl Proc_StartBlocking
	adds r0, #0x29
	movs r1, #0
	strb r1, [r0]
	movs r0, #0x43
	movs r2, #0
	bl StartBgmExt
	pop {r0}
	bx r0
	.align 2, 0
_080CB38C: .4byte 0x08B3F024

