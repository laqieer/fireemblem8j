	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80BB328, "ax", %progbits
@ sub_80BB328 @ JP 0x080BB328 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB328
	.thumb_func
sub_80BB328:
	push {lr}
	ldr r0, _080BB340 @ =0x08AC3114
	ldr r1, _080BB344 @ =0x06004C00
	bl sub_8013008
	ldr r0, _080BB348 @ =0x08BABE04
	ldr r1, _080BB34C @ =0x06008000
	bl sub_8013008
	pop {r0}
	bx r0
	.align 2, 0
_080BB340: .4byte 0x08AC3114
_080BB344: .4byte 0x06004C00
_080BB348: .4byte 0x08BABE04
_080BB34C: .4byte 0x06008000

