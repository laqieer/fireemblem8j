	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_8021360, "ax", %progbits
@ sub_8021360 @ JP 0x08021360 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021360
	.thumb_func
sub_8021360:
	push {lr}
	bl SetDefaultColorEffects
	ldr r0, _08021378 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08021378: .4byte 0x02022CA8

