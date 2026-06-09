	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_80C8C4C, "ax", %progbits
@ sub_80C8C4C @ JP 0x080C8C4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8C4C
	.thumb_func
sub_80C8C4C:
	push {lr}
	ldr r0, _080C8C70 @ =0x08AC2838
	bl Proc_EndEach
	ldr r0, _080C8C74 @ =0x08AC2898
	bl Proc_EndEach
	bl SetDefaultColorEffects
	ldr r0, _080C8C78 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080C8C70: .4byte 0x08AC2838
_080C8C74: .4byte 0x08AC2898
_080C8C78: .4byte 0x020234A8

