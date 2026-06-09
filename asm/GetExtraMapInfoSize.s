	.syntax unified
	.section .text.GetExtraMapInfoSize, "ax", %progbits
@ GetExtraMapInfoSize @ JP 0x080AB5EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetExtraMapInfoSize
	.thumb_func
GetExtraMapInfoSize:
	push {lr}
	ldr r2, _080AB600 @ =0x0203EF40
	ldr r1, [r2]
	ldr r0, _080AB604 @ =0x50414D58
	cmp r1, r0
	bne _080AB608
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	b _080AB60A
	.align 2, 0
_080AB600: .4byte 0x0203EF40
_080AB604: .4byte 0x50414D58
_080AB608:
	movs r0, #0
_080AB60A:
	pop {r1}
	bx r1
	.align 2, 0

