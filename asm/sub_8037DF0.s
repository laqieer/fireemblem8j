	.syntax unified
	.set UpdateDungeonEnemiesDefeated, 0x08038260 + 1
	.set sub_8037D38, 0x08037D38 + 1
	.section .text.sub_8037DF0, "ax", %progbits
@ sub_8037DF0 @ JP 0x08037DF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037DF0
	.thumb_func
sub_8037DF0:
	push {lr}
	bl sub_8037D38
	bl UpdateDungeonEnemiesDefeated
	pop {r0}
	bx r0
	.align 2, 0

